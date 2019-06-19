{
  build(version, os='linux', arch='amd64'):: {
    kind: 'pipeline',
    name: os + '-' + arch + '-' + version,
    platform: {
      os: os,
      arch: arch,
    },
    steps: [
      {
        name: 'lint',
        image: 'chusiang/ansible:' + version,
        pull: 'always',
        environment: {
          ANSIBLE_VERSION: version,
        },
        commands: [
          'echo "==> Syntax Check on Ansible ' + version + ' ..."',
          'ansible --version',
          'ansible-lint tasks/main.yml',
        ],
      },
    ],
  },
}
