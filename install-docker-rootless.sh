echo "Refresh the repository package list"
apt update

echo "Download the tools that enable adding the Docker's official GPG key over HTTPS"
apt install ca-certificates curl

echo "Create the keyrings directory with sufficient permissions"
install -m 0755 -d /etc/apt/keyrings

echo "Download the GPG key and place it in the directory created in the previous step"
curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc

echo "Change permissions for the keyring"
chmod a+r /etc/apt/keyrings/docker.asc

echo "Add the signed Docker repository to the list of sources on the system"
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null

echo "Refresh the package list again"
apt update

echo "Install the Docker packages"
apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin