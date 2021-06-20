from osureader.reader import BeatmapParser
from osureader.beatmap import Beatmap
import os 

"""
Example of how to run the project
"""
if __name__ == "__main__":
    reader = BeatmapParser()

    songs_path = "./songs"
    osu_songs = os.listdir(songs_path)
    
    all_beatmaps = {}
    for song in osu_songs:
        path = os.path.join(songs_path, song)
        if os.path.isdir(path):
            for file in os.listdir(path):
                if file.endswith(".osu"):
                    song_path = os.path.join(path, file)
                    if song not in all_beatmaps:
                        all_beatmaps[song] = []
                    print("Reading {}".format(song))
                    try:
                        all_beatmaps[song].append(Beatmap(reader.parse(song_path))) 
                    except:
                        print("Could not read {}".format(song))