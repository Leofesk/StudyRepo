@ECHO OFF
chcp 866

echo Author: Mikhail Gorelov
echo Project: FAVOA
echo Date: 21.01.2018

set gitFolder=C:\Temp\Study
set buildFolder=%gitFolder%\bin
set branchName=develop

IF EXIST %gitFolder% (
echo Pulling repository...
cd %gitFolder%
git pull || goto :E1
) ELSE (
echo Cloning repository...
git clone http://github.com/Leofesk/StudyRepo.git --branch %branchName% "%gitFolder%" || goto :E2
)

echo Restoring NuGet Packages...
"%gitFolder%\Tools\NuGet\nuget.exe" restore "%gitFolder%\FindAverageValueOfArray\FindAverageValueOfArray.sln" || goto :E3

echo Building the project...
"C:\Program Files (x86)\MSBuild\14.0\Bin\MSBuild.exe" "%gitFolder%\FindAverageValueOfArray\FindAverageValueOfArray.sln" /p:OutDir="%buildFolder%" /p:Configuration=Release || goto :E4

echo Testing the project...
"%gitFolder%\Tools\NUnit\nunit3-console.exe" "%buildFolder%\FindAverageValueOfArrayTests.dll" || goto :E5

echo Creating setup file...
cd "C:\Program Files (x86)\Inno Setup 5"
iscc "C:\Temp\Study\Tools\InnoSetup\CreateSetup.iss" || goto :E6

echo Installing application...

cd "%gitFolder%\Setup"
FAVOA.exe /VERYSILENT /SUPPRESSMSGBOXES /NORESTART || goto :E7

goto :DONE

:E1
echo Problems with pulling VCS repo!
goto :END
:E2
echo Problems with pulling VCS repo!
goto :END
:E3
echo Problems with restoring nuget packages!
goto :END
:E4
echo Problems with building the project!
goto :END
:E5
echo Problems with testing the project!
goto :END
:E6
echo Problems with creating setup file!
goto :END
:E7
echo Problems with installing application!
goto :END

:DONE
echo All operation was successfully done!

:END
pause