ckpt_path=$1
eval_split_name=$2
a_feat_type=pann
a_feat_dim=2050
feat_root=../features
a_feat_dir=${feat_root}/umt_pann_features/
eval_path=data/highlight_${eval_split_name}_release.jsonl
PYTHONPATH=$PYTHONPATH:. python qd_detr/inference.py \
--resume ${ckpt_path} \
--eval_split_name ${eval_split_name} \
--eval_path ${eval_path} \
--a_feat_dir ${a_feat_dir} \
--a_feat_dim ${a_feat_dim} \
${@:3}
