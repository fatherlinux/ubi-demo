#!/usr/bin/env sh

# Author: Scott McCarty <scott.mccarty@gmail.com>
# Twitter: @fatherlinux
# Date: 08/03/2021
# Description: Demonstrate UBI
 
# Setting up some colors for helping read the demo output.
# Comment out any of the below to turn off that color.
bold=$(tput bold)
cyan=$(tput setaf 6)
reset=$(tput sgr0)

read_color() {
    read -p "${bold}$1${reset}"
}

echo_color() {
    echo "${cyan}$1${reset}"
}

setup() {
	podman rm -a 2>&1 1>/dev/null
	buildah rm -a 2>&1 1>/dev/null
}

intro() {
    read -p "This demo will show you how to build, run and share container images using Red Hat Universal Base Image"
    echo
}

demo_one() {
	echo
	echo_color "Demo #1: Let's start with building from a Containerfile which is similar to a Dockerfile"
	echo
	read_color "vim Containerfile"
	vim Containerfile

	echo
	echo_color "Now, let's do the build"
	echo
	read_color "podman build -t ubi-containerfile"
	podman build -t ubi-containerfile .

	echo
	echo_color "Inspect the new image:"
	echo
	read_color "podman images | grep ubi-containerfile"
	podman images | grep ubi-containerfile

	echo
	echo_color "Now, run the new image:"
	echo
	read_color "podman run -it ubi-containerfile"
	podman run -it ubi-containerfile

}

demo_two() {
	echo
	echo_color "Demo #2: Let's demonstrate how to build an image from UBI Minimal"
	echo
	read_color "buildah from registry.access.redhat.com/ubi8/ubi-micro"
	buildah from registry.access.redhat.com/ubi8/ubi-micro

	echo
	echo_color "The output of **buildah from** gives us a reference to work with. From here, we can mount the filesystem of the new container:"
	echo
	read_color "buildah mount ubi-micro-working-container"
	BMOUNT=`buildah mount ubi-micro-working-container`
	echo $BMOUNT


}

pause() {
    echo
    read -p "Enter to continue"
    clear
}

presentation() {
    echo
    read -p "Go back to the presetnation..."
    clear
}

clean_images_and_containers() {
	echo
	echo_color "Now, let's clean up the containers and pods"
	echo
	read_color "podman kill -a;podman rm -a;podman pod kill -a;podman pod rm -a"
	podman kill -a;podman rm -a;podman pod kill -a;podman pod rm -a
}

setup
intro
#demo_one
demo_two
clean_images_and_containers

echo
echo "End of demo, thank you!"
