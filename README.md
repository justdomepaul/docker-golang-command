# docker-golang-glide-command
Thiis is a simple golang command by using docker to drive.

## Advantage
If you have docker environment, you can run golang command, need not install any golang environment and package.

## Version
1.0.0

## Usages

#### go command
```bash
$ ./drive.sh -e ./src/{project}/.env glide go {your golang subcommand}
```

#### get command
```bash
$ ./drive.sh -e ./src/{project}/.env glide get {packkage url}
```

#### fmt command
```bash
$ ./drive.sh -e ./src/{project}/.env glide fmt {dir path OR ./...}
```

#### run command
```bash
$ ./drive.sh -e ./src/{project}/.env glide run {file path}
```

#### test command
```bash
$ ./drive.sh -e ./src/{project}/.env glide test {dir path OR ./...}
```

#### installMac command
```bash
$ ./drive.sh -e ./src/{project}/.env glide installMac {dir path OR ./...}
```

#### installLinux command
```bash
$ ./drive.sh -e ./src/{project}/.env glide installLinux {dir path OR ./...}
```

#### installWindow command
```bash
$ ./drive.sh -e ./src/{project}/.env glide installWindow {dir path OR ./...}
```

#### glide command
```bash
$ ./vendor.sh -e ./src/{project}/.env glide {command}
```

#### glide init command
```bash
$ ./vendor.sh -e ./src/{project}/.env init
```

#### glide get command
```bash
$ ./vendor.sh -e ./src/{project}/.env get {url}
```

#### glide install command
```bash
$ ./vendor.sh -e ./src/{project}/.env install
```

#### glide list command
```bash
$ ./vendor.sh -e ./src/{project}/.env list
```

#### glide update command
```bash
$ ./vendor.sh -e ./src/{project}/.env update
```

#### glide rebuild command
```bash
$ ./vendor.sh -e ./src/{project}/.env rebuild
```

#### glide help command
```bash
$ ./vendor.sh -e ./src/{project}/.env help
```

## Point

#### set .env file
1. change .env.example to .env
2. add PROJECT_NAME in .env
3. PROJECT_NAME is ./src/{project(include main.go) folder name}
4. move .env to your project folder
5. init dep and have -e environment parameters
```bash
$ ./vendor.sh -e ./src/{project}/.env init

