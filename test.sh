V="v1"
if test ${V} = "v1"
then
  # MODEL_DIR=/Users/chenyao/Documents/tf_cosface_models/models/model-20180309-083949.ckpt-60000
  # MODEL_DIR=/Users/chenyao/Documents/tf_cosface_models/model-20180626-205832.ckpt-60000
  # MODEL_DIR=/Users/chenyao/Documents/20180918-103408/model-20180918-103408.ckpt-12000
  # MODEL_DIR=/Users/chenyao/Documents/now_models/20180914-194327/model-20180914-194327.ckpt-331
  MODEL_DIR=/Users/chenyao/Documents/now_models/20180919-162814/model-20180919-162814.ckpt-6000
  # TEST_DATA=/Users/chenyao/Documents/dataset/160/LFW_out
  TEST_DATA=/Users/chenyao/Documents/dataset/112X96/lfw/lfw-112X96
  EMBEDDING_SIZE=1024
  # EMBEDDING_SIZE=128
  FC_BN=''
  PREWHITEN='--prewhiten'
  IMAGE_WIDTH=96
else
  MODEL_DIR=models/model-20180626-205832.ckpt-60000
  TEST_DATA=dataset/lfw-112x112
  EMBEDDING_SIZE=1024  
  FC_BN='--fc_bn'
  PREWHITEN=''
  IMAGE_WIDTH=112
fi
IMAGE_HEIGHT=112
# IMAGE_SIZE=160
# modify from gpu to cpu
# CUDA_VISIBLE_DEVICES=1 python test/test.py ${TEST_DATA} ${MODEL_DIR} --lfw_file_ext jpg --network_type sphere_network --embedding_size ${EMBEDDING_SIZE} ${FC_BN} ${PREWHITEN} --image_height ${IMAGE_HEIGHT} --image_width ${IMAGE_WIDTH}
# 修改打印到日志中
python test/test.py ${TEST_DATA} ${MODEL_DIR} --lfw_file_ext jpg --network_type inception_resnet_v1 --embedding_size ${EMBEDDING_SIZE} ${FC_BN} ${PREWHITEN} --image_height ${IMAGE_HEIGHT} --image_width ${IMAGE_WIDTH}
# python test/test.py ${TEST_DATA} ${MODEL_DIR} --lfw_file_ext jpg --network_type sphere_network --embedding_size ${EMBEDDING_SIZE} ${FC_BN} ${PREWHITEN} --image_height ${IMAGE_HEIGHT} --image_width ${IMAGE_WIDTH} 2>&1 | tee /Users/chenyao/github/CosFace/log/cosface_testlog_20180824.log