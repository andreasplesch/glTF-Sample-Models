# adjust according to actual installation path of gltf-pipeline
# alias gltfpipe="node /home/user/ehome/projects/gltf/gltf-pipeline-master/bin/gltf-pipeline.js"
# below expects a functional gltfpipe command
for gltfDir in */glTF-MaterialsCommon
do
    cd $gltfDir
    for gltf in *gltf
    do
	echo $gltf
	dir=../glTF-Binary-MaterialsCommon
	[[ -d $dir ]] || mkdir $dir
	gltfpipe -i $gltf -b -kmc.enable -o $dir/${gltf%.gltf}.glb
	cd $dir
	mv output/* .
	rmdir output
    done
    cd ../..
done
