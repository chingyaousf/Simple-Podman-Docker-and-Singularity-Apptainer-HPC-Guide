##Docker commands

#Build docker image
docker build -t sample_app .

#Run docker container
docker run -it sample_app:latest


##Podman commands

#Build podman image
podman build -t sample_app .

#List podman images
podman images

#Run podman container
podman run -it localhost/sample_app

#List podman containers
podman ps -a 


##Singularity commands

#Build singularity image
singularity build hello.sif hello.def

#Run singularity container
singularity run -B $(pwd):/app/input hello.sif


##Running Singularity using a Container Created by Podman commands

#List all images
podman images

#List all containers
podman ps -a

#A convenience script called “mof-docker-upload” can save the Docker container to permanent network storage.
mof-docker-upload localhost/sample_app

#The script executes 4 Docker commands as following for you. Once they have all executed successfully, your image will be uploaded to localhost:5000 and permanent storage.
#Executed these commands 

docker commit --author 28ec6196ff06 nemp-students-and-trainees/sample_app
docker tag nemp-students-and-trainees/sample_app localhost:5000/nemp-students-and-trainees/sample_app
docker push --tls-verify=false localhost:5000/nemp-students-and-trainees/sample_app
docker image rm localhost/nemp-students-and-trainees/sample_app

##Running the Container Interactively

#Pull podman image and convert to apptainer(singularity) image .sif 
apptainer pull --no-https docker://localhost:5000/nemp-students-and-trainees/sample_app

#Run .sif image
apptainer run sample_app_latest.sif

#Run .sif image using exec command inside the container
apptainer exec sample_app_latest.sif cat /app/input/hello.txt

#Run the Container in Batch Mode
sbatch --output=output.txt --wrap "apptainer exec sample_app_latest.sif cat /app/input/hello.txt"