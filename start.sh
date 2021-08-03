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
	echo_color "Setting up"
	podman rm -a
	buildah rm -a
}

intro() {
    read -p "This demo will show you how to build, run and share container images using Red Hat Universal Base Image"
    echo
}

demo_one() {
	echo
	echo_color "Let's start with building from a Containerfile which is similar to a Dockerfile"
	echo
	read_color "vim Containerfile"
	vim Containerfile

	echo
	echo_color "Now, let's do the build"
	echo
	read_color "podman build -t ubi-containerfile"
	podman build -t ubi-containerfile .

	echo
	echo_color "Look at the new image that's built:"
	echo
	read_color "podman images | grep ubi-containerfile"
	podman images | grep ubi-containerfile

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
demo_one
clean_images_and_containers

echo
read -p "End of Demo!!!"
echo
echo "Thank you!"
