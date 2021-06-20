from osureader.objects import General, MetaData, Editor, Difficulty, HitCircle, TimingPoint, HitObject, TimingObject, SliderCircle
from typing import Union

class Beatmap():
    r"""
    Reads a beatmap into a usable object. Dict must be provided as an output
    of the beatmap parser.

    Args:
        beatmap (dict): Output from beatmap parser

    Examples:
        - Prerequisite:
            Path to a valid .osu file
        >>> parser = BeatmapParser()
        >>> res = parser.parser(song_path)
        >>> beatmap = Beatmap(res)
    """

    def __init__(self, beatmap: dict):
        try:
            self.general_settings = General(**beatmap['General'])
            self.editor_settings = Editor(**beatmap['Editor'])
            self.meta_data = MetaData(**beatmap['Metadata'])
            self.difficult_settings = Difficulty(**beatmap['Difficulty'])
            self.hit_objects = list(map(hitCircleType, beatmap['HitObjects']))
            self.timing_objects = [TimingPoint(**tp) for tp in beatmap['TimingPoints']]
        except:
            raise ValueError("Unable to parse supplied beatmap dict.")

def hitCircleType(obj) -> Union[SliderCircle, HitCircle]:
    """Determines the circle type to map to"""
    if 'curve_type' in obj:
        return SliderCircle(**obj)
    else:
        return HitCircle(**obj)