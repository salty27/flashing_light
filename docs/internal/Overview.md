# Overview

Project has been developed using VSCode along with `Ada & Spark` and `Wokwi Simulator` extensions. It uses Alire for toolchain and to import gnat-arm cross compiler. Care must be taken if building for a different board. Startup-gen program can be fetched from Alire and is used to generate necessary link.ld and crt0.S for each board. Wokwi is used for board simulation. Its peripherals and layout may be changed through diagram.json, and its firmware and general settings through wokwi.toml.

Source is divided in a HAL layer which can be reused across multiple projects as long as it uses the same board, and code specific to this project.