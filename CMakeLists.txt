cmake_minimum_required(VERSION 3.20)
project(SpaceGame LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

add_executable(SpaceGame
        main.cpp
        Renderer/renderer.cpp
        Game/GameWorld.cpp
        Game/Player/Player.cpp
        Game/Enemy/Enemy.cpp
        Game/Bullet/Bullet.cpp
        Game/Item/item.cpp
        Game/Player/Truster.cpp
        Game/StarField/StarField.cpp
        Game/Player/Spark.cpp
        Libs/Math.cpp
        Game/Planet/PlanetField.cpp
)

if(WIN32)
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

    add_compile_definitions(PLATFORM_WINDOWS)

elseif(UNIX AND NOT APPLE)
    find_package(raylib REQUIRED)

    target_link_libraries(SpaceGame PRIVATE
        raylib
    )

    add_compile_definitions(PLATFORM_LINUX)
endif()

if(MSVC)
    target_compile_options(SpaceGame PRIVATE /O2)
else()
    target_compile_options(SpaceGame PRIVATE -O2)
endif()