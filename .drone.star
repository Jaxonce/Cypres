def main(ctx):
    commit_message = ctx.build.message.lower()
    pipeline = []
    
    CI_Pipeline = {
        "kind": "pipeline",
        "name": "CI",
        "steps": {}
    }

    if "[no_ci]" in commit_message or "readme.md" in commit_message or "README.md" in commit_message:
        pipeline.append(CI_Empty())
        return pipeline
    
    CI_Pipeline["steps"] = [Build_App(),Build_Web(), Code_Analysis()]
    pipeline.append(CI_Pipeline)
    return pipeline

def Build_App():
    return {
        "name": "app-build",
        "image": "ghcr.io/cirruslabs/flutter:3.19.2",
        "commands": [
            "cd ./sources/",
            "flutter build apk"
        ]
    }
def Build_Web():
    return {
	"name": "build-web",
	"image": "ghcr.io/cirruslabs/flutter:3.19.2",
	"commands": [
	    "cd ./sources/",
	    "flutter build web --web-renderer canvaskit"
	]
    }

def Code_Analysis():
    return {
        "name": "code-analysis",
        "image": "ghcr.io/cirruslabs/flutter:3.19.2",
        "settings": {
            "sonar_token": {
                "from_secret": "SECRET_SONAR_LOGIN"
                }
        },
        "commands": [
            "export SONAR_SCANNER_VERSION=4.7.0.2747",
            "export SONAR_SCANNER_HOME=$HOME/.sonar/sonar-scanner-$SONAR_SCANNER_VERSION-linux",
            "curl --create-dirs -sSLo $HOME/.sonar/sonar-scanner.zip https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-$SONAR_SCANNER_VERSION-linux.zip",
            "unzip -o $HOME/.sonar/sonar-scanner.zip -d $HOME/.sonar/",
            "export PATH=$SONAR_SCANNER_HOME/bin:$PATH",
            "export SONAR_SCANNER_OPTS='-server'",
            "sonar-scanner -D sonar.projectKey=Cypres -D sonar.sources=./sources/ -D sonar.host.url=https://codefirst.iut.uca.fr/sonar -D sonar.login=$${PLUGIN_SONAR_TOKEN}"
        ],
        "depends_on": [ "app-build" ],
    }

def CI_Empty():
    return {
        "kind": "pipeline",
        "name": "EmptyPipeline",
        "steps": [
            
        ]
    }
