# Site 24x7 On Premise Poller

This is a Linux image suitable for use in Kubernetes Environments for the Site24x7 OnPremise Poller.

You simply need to pass in the **MY_247_DEVICE_KEY** environment variable at runtime to use your specific MSP device key and it will report in to Site 24x7 correctly.

More details can be found here - https://www.site24x7.com/help/admin/adding-a-monitor/on-premise-poller-for-linux.html

## Building New Image

If you want to build the image again you will need to pull down the poller image to get the latest

```bash
cd ~
git clone https://github.com/andyr8939/site24x7-kubernetes-onpremise-poller.git
cd site24x7-kubernetes-onpremise-poller
wget http://staticdownloads.site24x7.com/probe/Site24x7OnPremisePoller_64bit.bin
docker build --pull --rm -f DockerFile -t your_repo_name/site24x7-poller:1.0.0 "."
```

## Running in Kubernetes

You can utilize the manifest file provided, but I found that it needs a minimum of 700mb as a memory limit to avoid being OOMKilled.

Also, the reason for running as a StateFull Set is because each time the pod restarts with a deployment you get a new name, which is then registered in Site24x7,
whereas with a StateFull Set the name is aways the same.

Andy Roberts

https://github.com/andyr8939/site24x7-kubernetes-onpremise-poller