Model checkpoint [model_best.ckpt](model_best.ckpt) provided for running example data is only trained with QVhighlights video and text features using CLIP as input (No slowfast features used). 
It is trained from scratch, without ASR pre-training. 

To run the code with video/videoaudio model ckpt that are trained with slowfast+clip features, you need to prepare slowfast features and modify some implementations.
