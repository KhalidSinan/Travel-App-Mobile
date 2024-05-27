@echo off
set /p FolderName="Enter the feature name: "
mkdir .\lib\features\%FolderName%
cd .\lib\features\%FolderName%
mkdir data presentation
cd data
mkdir models repos
cd models
echo.>.gitkeep
cd ..
cd repos
echo.>.gitkeep
cd ../..
cd presentation
mkdir view_model views
cd view_model
echo.>.gitkeep
cd ..
cd views
mkdir widgets
cd widgets
echo.>.gitkeep
