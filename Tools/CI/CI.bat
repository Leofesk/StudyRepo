@ECHO OFF
chcp 866

echo ------------------------------------------------------------------------------------------------
echo Author: Mikhail Gorelov
echo Project: FAVOA
echo Date: 21.01.2018
echo ------------------------------------------------------------------------------------------------

set gitFolder=C:\Temp\Study
set buildFolder=%gitFolder%\bin
set branchName=develop

IF EXIST %gitFolder% (
echo Pulling repository...
echo ------------------------------------------------------------------------------------------------
cd %gitFolder%
git pull || goto :E1
) ELSE (
echo Cloning repository...
echo ------------------------------------------------------------------------------------------------
git clone http://github.com/Leofesk/StudyRepo.git --branch %branchName% "%gitFolder%" || goto :E2
)
echo ------------------------------------------------------------------------------------------------
echo Restoring NuGet Packages...
echo ------------------------------------------------------------------------------------------------
"%gitFolder%\Tools\NuGet\nuget.exe" restore "%gitFolder%\FindAverageValueOfArray\FindAverageValueOfArray.sln" || goto :E3
echo ------------------------------------------------------------------------------------------------
echo Building the project...
echo ------------------------------------------------------------------------------------------------
"C:\Program Files (x86)\MSBuild\14.0\Bin\MSBuild.exe" "%gitFolder%\FindAverageValueOfArray\FindAverageValueOfArray.sln" /p:OutDir="%buildFolder%" /p:Configuration=Release || goto :E4
echo ------------------------------------------------------------------------------------------------
echo Testing the project...
echo ------------------------------------------------------------------------------------------------
"%gitFolder%\Tools\NUnit\nunit3-console.exe" "%buildFolder%\FindAverageValueOfArrayTests.dll" || goto :E5
echo ------------------------------------------------------------------------------------------------
echo Creating setup file...
echo ------------------------------------------------------------------------------------------------
cd "C:\Program Files (x86)\Inno Setup 5"
iscc "C:\Temp\Study\Tools\InnoSetup\CreateSetup.iss" || goto :E6
echo ------------------------------------------------------------------------------------------------
echo Installing application...
echo ------------------------------------------------------------------------------------------------

cd "%gitFolder%\Setup"
FAVOA.exe /VERYSILENT /SUPPRESSMSGBOXES /NORESTART || goto :E7

goto :DONE

:E1
echo ------------------------------------------------------------------------------------------------
echo Problems with pulling VCS repo!
echo ------------------------------------------------------------------------------------------------
goto :END
:E2
echo ------------------------------------------------------------------------------------------------
echo Problems with pulling VCS repo!
echo ------------------------------------------------------------------------------------------------
goto :END
:E3
echo ------------------------------------------------------------------------------------------------
echo Problems with restoring nuget packages!
echo ------------------------------------------------------------------------------------------------
goto :END
:E4
echo ------------------------------------------------------------------------------------------------
echo Problems with building the project!
echo ------------------------------------------------------------------------------------------------
goto :END
:E5
echo ------------------------------------------------------------------------------------------------
echo Problems with testing the project!
echo ------------------------------------------------------------------------------------------------
goto :END
:E6
echo ------------------------------------------------------------------------------------------------
echo Problems with creating setup file!
echo ------------------------------------------------------------------------------------------------
goto :END
:E7
echo ------------------------------------------------------------------------------------------------
echo Problems with installing application!
echo ------------------------------------------------------------------------------------------------
goto :END

:DONE
echo All operation was successfully done!
echo ------------------------------------------------------------------------------------------------
:END
pause