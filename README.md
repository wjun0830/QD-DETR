# QD-DETR : Query-Dependent Video Representation for Moment Retrieval and Highlight Detection




## Getting Started 

### Prerequisites
0. Clone this repo

1. Prepare official feature files for QVHighlights dataset from Moment-DETR. 

Download [moment_detr_features.tar.gz](https://drive.google.com/file/d/1Hiln02F1NEpoW8-iPZurRyi-47-W2_B9/view?usp=sharing) (8GB), 
extract it under project root directory:
```
tar -xf path/to/moment_detr_features.tar.gz
```

2. Install dependencies.
Python version 3.7 is required.
```
pip install -r requirements.txt
```
Requirements.txt also include other libraries. Will be cleaned up soon.
For anaconda setup, please refer to the official [Moment-DETR github](https://github.com/jayleicn/moment_detr).

### Training
Training with (only video) and (video + audio) can be executed by running the shell below:
```
bash qd_detr/scripts/train.sh 
bash qd_detr/scripts/train_audio.sh 
```
Best validation accuracy is yielded at the last epoch. 

### Inference Evaluation and Codalab Submission
Once the model is trained, `hl_val_submission.jsonl` and `hl_test_submission.jsonl` can be yielded by running inference.sh.
```
bash qd_detr/scripts/inference.sh results/{direc}/model_best.ckpt 'val'
bash qd_detr/scripts/inference.sh results/{direc}/model_best.ckpt 'test'
```
where `direc` is the path to the saved checkpoint.
For more details for submission, check [standalone_eval/README.md](standalone_eval/README.md).


### Pretraining and Finetuning
Pretraining with ASR captions is also available.
To launch pretraining, run:
```
bash qd_detr/scripts/pretrain.sh 
```  
This will pretrain the QD-DETR model on the ASR captions for 100 epochs, the pretrained checkpoints and other experiment log files will be written into `results`. 
With the pretrained checkpoint, we can launch finetuning from a pretrained checkpoint `PRETRAIN_CHECKPOINT_PATH` as:
```
bash qd_detr/scripts/train.sh  --resume ${PRETRAIN_CHECKPOINT_PATH}
```
Note that this finetuning process is the same as standard training except that it initializes weights from a pretrained checkpoint. 




### Others
- Pretraining with ASR captions
- Runninng predictions on customized datasets

are also available as we use the official implementation for Moment-DETR as the basis. 
For the instructions, check their [github](https://github.com/jayleicn/moment_detr).
 

## LICENSE
The annotation files and many parts of the implementations are borrowed Moment-DETR.
Following, our codes are also under [MIT](https://opensource.org/licenses/MIT) license.
 
