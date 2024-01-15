# OpenCLIP

Modified Files:

src/training/main.py

    L22: modify tensorboard to tensorboardX (version issue)
    L223-224: give model argument "max_seq_len" for specifying the maximum sequence length for videos.
    L225-244: give argument "data_type" for model and data transform configuration

src/training/params.py

    L68-73: Add "csv_video" dataset type
    L74-79: Add "data_type" argument to specify the data type (images or videos)
    L80-85: Add "max_seq_len" to specify the maximum sequence (frame) length for videos

src/open_clip/model.py