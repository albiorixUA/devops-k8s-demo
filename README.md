# TGBot

DevOps application from scratch

**TGBot** is a Telegram bot written in the Go programming language, utilizing the Cobra-CLI v1.8.0 framework for command handling and Telebot v3.1.4 for integration with the Telegram API.

## Installation  

To get started with KBot, clone the repository:

```bash
git clone https://github.com/albiorixUA/devops-k8s-demo.git
cd devops-k8s-demo
```

To install all necessary dependencies and compile the project, use:

```bash
go get
go build -ldflags "-X="github.com/albiorixUA/devops-k8s-demo/cmd.appVersion=v1.0.2
```

To test the compiled project, do the following:

```bash
./tgbot version
```

as a result, you should get the app's version `v1.0.2`.

## Configuration

Enter your Telegram bot token in silent mode:

```bash
read -s TELE_TOKEN
```

Export the value of the TELE TOKEN variable to the current shell environment.

```bash
export TELE_TOKEN
```

## Running

Run KBot using the following command:

```bash
./tgbot start
```

## Link to Telegram bot

[@albiorix_ua_bot](https://t.me/albiorix_ua_bot)

## Usage

This project uses a Makefile for common tasks. Run the following commands:

- Format Code: `make format`
- Lint Code: `make lint`
- Run Tests: `make test`
- Get Dependencies: `make get`
- Build Application: `make build` (Override `REGISTRY`, `TARGETOS` and `TARGETARCH` with `make build REGISTRY=albiorixua TARGETOS=windows TARGETARCH=amd64`)
- Create Docker Image: `make image` (Override `REGISTRY`, `TARGETOS` and `TARGETARCH` with `make image REGISTRY=albiorixua TARGETOS=windows TARGETARCH=amd64`)
- Push Docker Image: `make push` (Override `REGISTRY`, `TARGETOS` and `TARGETARCH` with `make push REGISTRY=albiorixua TARGETOS=windows TARGETARCH=amd64`)
- Clean: `make clean`

# Adding the pre-commit hook

1. **Adding the pre-commit hook:**
   - Move the `pre-commit` file to the `.git/hooks/` folder:

     ```bash
     cp pre-commit .git/hooks/
     ```

   - Alternatively, create a symbolic link::

     ```bash
     ln -s pre-commit .git/hooks/pre-commit
     ```

   - Ensure that the file has execute permissions:

     ```bash
     chmod +x pre-commit
     ```  

3. **Activating GitLeaks:**
   - Run the command to activate GitLeaks:

     ```bash
     git config hooks.gitleaks.enable true
     ```

4. **Commit attempt:**
   - Now, with each commit attempt, your pre-commit script will check the code for the presence of sensitive information.

   - If secrets are detected, the commit will be rejected, and you will receive an error message.
