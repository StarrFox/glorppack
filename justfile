set windows-shell := ["powershell"]

# show this list
default:
    just --list

# export mrpack
export: refresh
    mkdir dist -Force
    packwiz modrinth export --cache cache
    mv *.mrpack dist/ -Force

# refresh packwiz index
refresh:
    packwiz refresh

# update everything
update: update-mods update-loader

# update all mods
update-mods:
    packwiz update --all

# update loader to latest version
update-loader:
    packwiz migrate loader latest

modrinth url:
    packwiz modrinth install {{url}}

curseforge url:
    packwiz curseforge install {{url}}
