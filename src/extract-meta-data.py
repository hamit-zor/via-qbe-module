"""Extract metadata from video."""
if __name__ == "__main__":
    from modules import args, stdout
    import cv2
    import time
    from os import path
    import argparse
    import json

    parser = argparse.ArgumentParser()

    parser.add_argument(
        "video_file", help="File to be inserted")

    args = parser.parse_args()
    stdout = stdout.Stdout(False)
    start_time = time.time() * 1000
    video_file = path.abspath(args.video_file)

    if not path.isfile(video_file):
        stdout.write("%s is not a file" % video_file)
        exit(-1)

    # read video file to extract meta data
    video_cap = cv2.VideoCapture(video_file)
    fps = video_cap.get(cv2.CAP_PROP_FPS)
    total_frame = video_cap.get(cv2.CAP_PROP_FRAME_COUNT)
    width = int(video_cap.get(cv2.CAP_PROP_FRAME_WIDTH))
    height = int(video_cap.get(cv2.CAP_PROP_FRAME_HEIGHT))
    video_cap.release()

    length = (total_frame/fps)*1000
    size = path.getsize(video_file)

    data = dict(
        lenght=length,
        size=size,
        fps=fps,
        total_frame=total_frame,
        width=width,
        height=height
    )

    print json.dumps(data, indent=2)

    exit(0)
