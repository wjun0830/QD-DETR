# QD-DETR : Query-Dependent Video Representation for Moment Retrieval and Highlight Detection (CVPR 2023 Paper)
by 
WonJun Moon<sup>*1</sup>, SangEek Hyun<sup>*1</sup>, SangUk Park<sup>2</sup>, Dongchan Park<sup>2</sup>, Jae-Pil Heo<sup>1</sup>

<sup>1</sup> Sungkyunkwan University, <sup>2</sup> Pyler, <sup>*</sup> Equal Contribution

	
[![PWC](https://img.shields.io/endpoint.svg?url=https://paperswithcode.com/badge/query-dependent-video-representation-for/moment-retrieval-on-charades-sta)](https://paperswithcode.com/sota/moment-retrieval-on-charades-sta?p=query-dependent-video-representation-for)
[![PWC](https://img.shields.io/endpoint.svg?url=https://paperswithcode.com/badge/query-dependent-video-representation-for/moment-retrieval-on-qvhighlights)](https://paperswithcode.com/sota/moment-retrieval-on-qvhighlights?p=query-dependent-video-representation-for)
[![PWC](https://img.shields.io/endpoint.svg?url=https://paperswithcode.com/badge/query-dependent-video-representation-for/highlight-detection-on-tvsum)](https://paperswithcode.com/sota/highlight-detection-on-tvsum?p=query-dependent-video-representation-for)

[[Arxiv](https://arxiv.org/abs/2303.13874)] [[Paper](https://openaccess.thecvf.com/content/CVPR2023/papers/Moon_Query-Dependent_Video_Representation_for_Moment_Retrieval_and_Highlight_Detection_CVPR_2023_paper.pdf)] [[Project Page](https://wjun0830.github.io/cvpr2023/QDDETR/)] [[Video](https://www.youtube.com/watch?v=df-gtJcZEw8&t=1s&ab_channel=WonJunMoon)]

----------
## Updates & News 
* Charades-STA experiments with C3D features are actually conducted with I3D features and I3D benchmarking tables.
Features are provided [here](https://app.box.com/s/h0sxa5klco6qve5ahnz50ly2nksmuedw) from [VSLNET Github](https://github.com/26hzhang/VSLNet/tree/master).
Sorry for the inconvenience.

## Prerequisites
<b>0. Clone this repo</b>

<b>1. Prepare datasets</b>

<b>QVHighlights</b> : Download official feature files for QVHighlights dataset from Moment-DETR. 

Download [moment_detr_features.tar.gz](https://drive.google.com/file/d/1Hiln02F1NEpoW8-iPZurRyi-47-W2_B9/view?usp=sharing) (8GB), 
extract it under '../features' directory.
You can change the data directory by modifying 'feat_root' in shell scripts under 'qd_detr/scripts/' directory.
```
tar -xf path/to/moment_detr_features.tar.gz
```


<b>TVSum</b> : Download feature files for TVSum dataset from UMT.

Download [TVSum](https://connectpolyu-my.sharepoint.com/personal/21039533r_connect_polyu_hk/_layouts/15/onedrive.aspx?id=%2Fpersonal%2F21039533r%5Fconnect%5Fpolyu%5Fhk%2FDocuments%2FZoo%2FReleases%2FUMT%2Ftvsum%2Dec05ad4e%2Ezip&parent=%2Fpersonal%2F21039533r%5Fconnect%5Fpolyu%5Fhk%2FDocuments%2FZoo%2FReleases%2FUMT&ga=1) (69.1MB),
and either extract it under '../features/tvsum/' directory or change 'feat_root' in TVSum shell files under 'qd_detr/scripts/tvsum/'.


<b>2. Install dependencies.</b>
Python version 3.7 is required.
```
pip install -r requirements.txt
```
For anaconda setup, please refer to the official [Moment-DETR github](https://github.com/jayleicn/moment_detr).

## QVHighlights

### Training
Training with (only video) and (video + audio) can be executed by running the shell below:
```
bash qd_detr/scripts/train.sh --seed 2018
bash qd_detr/scripts/train_audio.sh --seed 2018
```
To calculate the standard deviation in the paper, we ran with 5 different seeds 0, 1, 2, 3, and 2018 (2018 is the seed used in Moment-DETR).
Best validation accuracy is yielded at the last epoch. 

### Inference Evaluation and Codalab Submission for QVHighlights
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

## TVSum
Training with (only video) and (video + audio) can be executed by running the shell below:
```
bash qd_detr/scripts/tvsum/train_tvsum.sh 
bash qd_detr/scripts/tvsum/train_tvsum_audio.sh 
```
Best results are stored in 'results_[domain_name]/best_metric.jsonl'.



### Others
- Pretraining with ASR captions
- Runninng predictions on customized datasets

are also available as we use the official implementation for Moment-DETR as the basis. 
For the instructions, check their [github](https://github.com/jayleicn/moment_detr).


### QVHighlights pretrained checkpoints
 Method (Modality) | Model file
 -- | -- 
QD-DETR (Video+Audio) Checkpoint | [link](https://www.dropbox.com/s/hsc7jk21ppqasjt/videoaudio.ckpt?dl=0)
QD-DETR (Video only) Checkpoint | [link](https://www.dropbox.com/s/yygwyljw8514d9r/videoonly.ckpt?dl=0)
 
##  Cite QD-DETR (Query-Dependent Video Representation for Moment Retrieval and Highlight Detection)

If you find this repository useful, please use the following entry for citation.
```
@inproceedings{moon2023query,
  title={Query-dependent video representation for moment retrieval and highlight detection},
  author={Moon, WonJun and Hyun, Sangeek and Park, SangUk and Park, Dongchan and Heo, Jae-Pil},
  booktitle={Proceedings of the IEEE/CVF Conference on Computer Vision and Pattern Recognition},
  pages={23023--23033},
  year={2023}
}
```

## Contributors and Contact

If there are any questions, feel free to contact with the authors: WonJun Moon (wjun0830@gmail.com), Sangeek Hyun (hse1032@gmail.com).


## LICENSE
The annotation files and many parts of the implementations are borrowed Moment-DETR.
Following, our codes are also under [MIT](https://opensource.org/licenses/MIT) license.
 
