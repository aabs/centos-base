# centos-base
A simple IAC build system to establish a centos VM image suitable for secure use

## Development environment

You will need to install:

- `make` or `nmake` to run the Makefile
- packer
- virtualbox to create the `virtualbox-iso` builder
- Hyper-V

You will also need to do the following:

- Add yourself to the `Hyper-V Administrators` group on your machine
- Run the VS Command Prompt as Administrator


# temporary dumping ground

```json

{
  "type": "shell",
  "inline":[
    "mkdir -p /tmp/ansible"
  ]
},
{
  "type": "file",
  "source": "./ansible/",
  "destination": "/tmp/ansible/",
  "direction": "upload"
},
{
  "type": "shell",
  "execute_command": "echo 'vagrant' | {{.Vars}} sudo -S -E bash '{{.Path}}'",
  "script": "scripts/cis-ansible.sh"
}

```
