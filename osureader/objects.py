from enum import Enum, unique, IntFlag
from ctypes import c_uint8
from typing import Tuple
from abc import ABC

class GeneralSettings(ABC):
    def __init__(self,
                audio_filename: str,
                audio_hash: str=None,
                audio_lead_in: int=0,
                preview_time: int=-1,
                countdown: int=1,
                sample_set: str="Normal",
                stack_leniency: float=0.7,
                mode: int=0,
                letterbox_in_breaks: c_uint8=0,
                story_fire_in_front: c_uint8=1,
                use_skin_sprites: c_uint8=0,
                always_show_play_field: c_uint8=0,
                overlay_position: str="NoChange",
                epilepsy_warning: c_uint8=0,
                countdown_offset: int=0,
                special_style: c_uint8=0,
                widescreen_storyboard: c_uint8=1,
                samples_match_playback_rate: c_uint8=0,
                **kwargs):
        self.audio_file_name = audio_filename
        self.audio_lead_in = int(audio_lead_in)
        self.preview_time = int(preview_time)
        self.countdown = int(countdown)
        self.sample_set = sample_set
        self.stack_leniency = float(stack_leniency)
        self.mode = int(mode)
        self.letterbox_in_breaks = int(letterbox_in_breaks)
        self.widescreen_storyboard = int(widescreen_storyboard)

class EditorSettings(ABC):
    def __init__(self,
                distance_spacing: float,
                beat_divisor: float,
                grid_size: int,
                bookmarks: str=None,
                timeline_zoom: float=1.0):
        self.bookmarks = bookmarks
        self.distance_spacing = float(distance_spacing)
        self.beat_divisor = int(beat_divisor)
        self.grid_size = int(grid_size)
        self.timeline_zoom = float(timeline_zoom)

class MetaDetaSettings(ABC):
    def __init__(self,
                title: str,
                artist: str,
                creator: str,
                version: str,
                source: str,
                tags: str,
                title_unicode: str=None,
                artist_unicode: str=None,
                beatmap_i_d: int=None,
                beatmap_set_i_d: int=None):
        self.title = title
        self.title_unicode = title_unicode
        self.artist = artist
        self.artist_unicode = artist_unicode
        self.creator = creator
        self.version = version
        self.source = source
        self.tags = tags
        self.beatmap_id = beatmap_i_d
        self.beatmap_set_id = beatmap_set_i_d

class DifficultySettings(ABC):
    def __init__(self,
                h_p_drain_rate: int,
                circle_size: float,
                overall_difficulty: float,
                approach_rate: float,
                slider_multiplier: float,
                slider_tick_rate: int):
        self.hp_drain_rate = float(h_p_drain_rate)
        self.circle_size = float(circle_size)
        self.overall_difficulty = float(overall_difficulty)
        self.approach_rate = float(approach_rate)
        self.slider_multiplier = float(slider_multiplier)
        self.slider_tick_rate = int(slider_tick_rate)

class TimingObject(ABC):
    def __init__(self,
                time: int,
                beat_length: float,
                meter: int,
                sample_set: int,
                sample_index: int,
                volume: int,
                uninherited: int,
                effects: int):
        self.time = int(time)
        self.beat_length = float(beat_length)
        self.meter = int(meter)
        self.sample_set = int(sample_set)
        self.sample_index = int(sample_index)
        self.volume = int(volume)
        self.uninherited = int(uninherited)
        self.effects = int(effects)

class HitObjectType(IntFlag):
	CIRCLE          = 0b00000001
	SLIDER          = 0b00000010
	NEW_COMBO       = 0b00000100
	SPINNER         = 0b00001000
	COMBO_SKIP      = 0b01110000
	MANIA_HOLD      = 0b10000000

@unique
class SliderType(Enum):
    LINEAR = 'L'
    BEZIER = 'B'
    PERFECT = 'P'
    CATMUL = 'C'

class PointVector:
    def __init__(self,
                x: int,
                y: int):
        self.x = int(x)
        self.y = int(y)

class HitObject(ABC):
    def __init__(self, 
                x: int, 
                y: int, 
                time: str, 
                type: str, 
                hitsound: str, 
                extras: str=None, 
                **kwargs):
        self.point = PointVector(x, y)
        self.time = int(time)
        self.type = HitObjectType(HitObjectType(int(type)))
        self.hitsound = int(hitsound)
        self.extras = extras

class SliderObject(HitObject):
    def __init__(self,
                curve_type: str,
                slides: int,
                length: int,
                curve_points: Tuple[dict],
                edge_sounds: str=None,
                edge_sets: str=None,
                **kwargs):
        super().__init__(**kwargs)
        self.curve_type = SliderType(curve_type)
        self.curve_points = [PointVector(**coord) for coord in curve_points]
        self.slides = slides
        self.length = length
        self.edge_sounds = edge_sounds
        self.edge_sets = edge_sets

class HitCircle(HitObject):
    def __init__(self, **kwargs):
        super().__init__(**kwargs)

class SliderCircle(SliderObject):
    def __init__(self, **kwargs):
        super().__init__(**kwargs)

class TimingPoint(TimingObject):
    def __init__(self, **kwargs):
        super().__init__(**kwargs)

class General(GeneralSettings):
    def __init__(self, **kwargs):
        super().__init__(**kwargs)

class MetaData(MetaDetaSettings):
    def __init__(self, **kwargs):
        super().__init__(**kwargs)

class Editor(EditorSettings):
    def __init__(self, **kwargs):
        super().__init__(**kwargs)

class Difficulty(DifficultySettings):
    def __init__(self, **kwargs):
        super().__init__(**kwargs)