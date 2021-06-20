from osureader.errors import CouldNotParseBeatmapException
from typing import Tuple, Union
import osureader.objects
import json
import re

_SECTION_TYPES = [
    'General', 
    'Editor', 
    'Metadata', 
    'Difficulty', 
    'Events', 
    'TimingPoints', 
    'Colours', 
    'HitObjects'
]
_SLIDER_TYPES = ['C','L','P','B']

class BeatmapParser:
    r"""
    Parses a .osu beatmap file so it can be converted into a Beatmap object or
    so that it can be manually interpreted using your own beatmap object
    """

    def __parse_timing_objects(self, line: str, sector: str, beatmap_dict: dict):
        """
        Parses a time object line in the beatmap file.

        Args:
            line (str): line of the file of the reader
            sector (str): String sector name which would be the timing string
            beatmap_dict (dict): Dict to write the data to

        """

        item = line.split(',')
        point = {
            'time': item[0],
            'beat_length': item[1],
            'meter': item[2],
            'sample_set': item[3],
            'sample_index': item[4],
            'volume': item[5],
            'uninherited': item[6],
            'effects': item[7]
        }
        beatmap_dict[sector].append(point)

    def __parse_hit_objects(self, line: str, sector: str, beatmap_dict: dict):
        """
        Parses a hit object line in the beatmap file.

        Args:
            line (str): line of the file of the reader
            sector (str): String sector name which would be the hit object string
            beatmap_dict (dict): Dict to write the data to
        """

        item = line.split(',')
        point = {
            'x': item[0],
            'y': item[1],
            'time': item[2],
            'type': item[3],
            'hitsound': item[4]
        }
        if len(item) > 5: 
            if not any(curve_type in item[5] for curve_type in _SLIDER_TYPES):
                point['extras'] = item[5]
            else:
                try:
                    ct_cp = item[5].split("|")
                    point['curve_type'] = ct_cp[0]
                    point['curve_points'] = tuple([{'x': params.split(':')[0], 'y': params.split(':')[1]} for params in ct_cp[1:]])
                    point['slides'] = item[6]
                    point['length'] = item[7]
                    point['edge_sounds'] = item[8]
                    point['edge_sets'] = item[9]
                except:
                    pass
        beatmap_dict[sector].append(point)

    def __parse_line(self, line: str, sector: str, beatmap_dict: dict):
        """
        Parses a singular line from the osu file. If it is not a duplicate object
        section it will parse it and write it into the dict. Otherwise call above
        functions to parse those specific sections individually.
        
        Args:
            line (str): line of the file of the reader
            sector (str): Sector that the file parser is currently going through
            beatmap_dict (dict): Dict to write the data to
        """

        if sector == "TimingPoints":
            if sector not in beatmap_dict:
                beatmap_dict[sector] = []
            if "," not in line:
                return
            self.__parse_timing_objects(line, sector, beatmap_dict)
        elif sector == "HitObjects":
            if sector not in beatmap_dict:
                beatmap_dict[sector] = []
            if "," not in line:
                return
            self.__parse_hit_objects(line, sector, beatmap_dict)
        else:
            if sector not in beatmap_dict:
                beatmap_dict[sector] = {}
            if ":" not in line:
                return
            item = line.split(":")
            value = item[1].replace('\n', '')
            key = "_".join(re.sub(r"([A-Z])", r" \1", item[0]).lower().split())
            beatmap_dict[sector][key] = value


    def __check_for_header(self, line: str) -> Union[str, None]:
        """Checks if there is a header in the current line of the file"""
        for section in _SECTION_TYPES:
            if section in line:
                return section
        return None

    def parse(self, osu_beatmap_path: str) -> dict:
        """
        Parses the file object based on an absolute path to the file.

        Args:
            osu_beatmap_path (str): Absolute path to the file

        Returns:
            Beatmap json object (dict): Dict which has all of the relevent sections
                                        from the file. This can then be used to form
                                        a beatmap object or just to use individually.
        
        Raises:
            CouldNotParseBeatmapExeption: Error parsing the beatmap                 
        """

        try:
            file = open(osu_beatmap_path, 'r+', encoding="utf8").readlines()
            current_sector = None
            beatmap_dict = {}
            for line in file:
                if line == '' or line=='\n':
                    continue
                callback = self.__check_for_header(line)
                if callback is not None:
                    current_sector = callback
                if current_sector is not None:
                    self.__parse_line(line, current_sector, beatmap_dict)
            return beatmap_dict
        except Exception as e:
            raise CouldNotParseBeatmapException(e)
                
    def dump(self, beatmap_dict: dict):
        """Dumps a beatmap object to a json file as a dict"""
        try:
            output = json.dumps(beatmap_dict).replace('\n','')
            with open(beatmap_dict['Metadata']['title'].rstrip() + '.json', 'w') as file:
                file.write(output)
            print(beatmap_dict['Metadata']['title'].rstrip()+'.json has been successfully written.')
        except Exception as e:
            print(e)