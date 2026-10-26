cmake_minimum_required(VERSION 3.20)
project(SpaceGame LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

add_executable(SpaceGame WIN32
        main.cpp
        Renderer/renderer.cpp
        Game/GameWorld.cpp
        Game/Player/Player.cpp
        Game/Enemy/Enemy.cpp
        Game/Bullet/Bullet.cpp
        Game/Item/item.cpp
        Game/Player/Truster.cpp
        Game/Player/Truster.h
        Game/StarField/StarField.cpp
        Game/StarField/StarField.h
        Game/Player/Spark.cpp
        Game/Player/Spark.h
        Libs/Math.cpp
        Game/Planet/PlanetField.cpp
        Game/Planet/PlanetField.h
)

target_include_directories(SpaceGame PRIVATE
        "C:/Users/Zotyi/Downloads/mingw64/include"
)

target_link_directories(SpaceGame PRIVATE
        "C:/Users/Zotyi/Downloads/mingw64/lib"
)

target_link_libraries(SpaceGame PRIVATE
        raylib
        opengl32
        gdi32
        winmm
)

target_compile_options(SpaceGame PRIVATE -O2)