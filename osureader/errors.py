class CouldNotParseBeatmapException(Exception):
    def __init__(self, message="Unable to parse the beatmap."):
        super().__init__(message)