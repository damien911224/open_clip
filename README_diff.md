
# Modified Files

## scripts/video_clip.sh

    New file for training video clip model

## requirements.txt

    L10-12: Add packages for video clip

## src/training/main.py

    L22: Modify tensorboard to tensorboardX (version issue)
    L223-224: Give model argument "max_seq_len" for specifying the maximum sequence length for videos.
    L225-244: Give argument "data_type" for model and data transform configuration

## src/training/params.py

    L50-55: Add "dataset_root_folder" to specify the root folder for the dataset
    L68-73: Add "csv_video" dataset type
    L74-79: Add "data_type" argument to specify the data type (images or videos)
    L80-85: Add "max_seq_len" to specify the maximum sequence (frame) length for videos

## src/open_clip/model.py

    L398-455: Add "VideoCLIP" model which inherits CLIP model

## src/open_clip/factory.py

    L256-257: Add initailization of "VideoCLIP" in create model function
    L423-432: Add configuration of video transformation in create model and transforms function

## src/training/data.py

    L55-104: Add "CsvVideoDataset" for video data 
    L532-561: Add "get_csv_video_dataset" for creating CsvVideoDataset

## src/open_clip_transform.py

    L398-462: Add "video_transform" function to define transformations for videos
    L481_495: Add "video_transform_v2" function for comparability