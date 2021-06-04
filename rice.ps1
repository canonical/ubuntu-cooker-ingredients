    # root folder
    Find-AndReplace .\launcher\DistroLauncher.sln '"DistroLauncher-Appx"' '"Ubuntu"'
    Find-AndReplace .\launcher\DistroLauncher.sln 'DistroLauncher-Appx.' 'Ubuntu.'

    # DistroLauncher
    Copy-Item -Recurse -Force .\ingredients\sourcecode\* .\launcher\DistroLauncher\
    Find-AndReplace .\launcher\DistroLauncher\DistributionInfo.h 'MyDistribution' "$RegName"
    Find-AndReplace .\launcher\DistroLauncher\DistributionInfo.h 'My Distribution' "$FullName"
    Find-AndReplace .\launcher\DistroLauncher\DistroLauncher.vcxproj 'v141' 'v142'
    
    Rename-Item -Path .\launcher\DistroLauncher-Appx\DistroLauncher-Appx.vcxproj -NewName Ubuntu.vcxproj
    Rename-Item -Path .\launcher\DistroLauncher-Appx\DistroLauncher-Appx.vcxproj.filters -NewName Ubuntu.vcxproj.filters

    Find-AndReplace .\launcher\DistroLauncher-Appx\Ubuntu.vcxproj.filters 'MyDistro.appxmanifest' '$(Platform)/Ubuntu.appxmanifest'
    Find-AndReplace .\launcher\DistroLauncher-Appx\Ubuntu.vcxproj.filters '<None Include="Package.StoreAssociation.xml" />' ''

    Find-AndReplace .\launcher\DistroLauncher-Appx\Ubuntu.vcxproj 'v141' 'v142'
    Find-AndReplace .\launcher\DistroLauncher-Appx\Ubuntu.vcxproj 'MyDistro.appxmanifest' '$(Platform)/Ubuntu.appxmanifest'
    Find-AndReplace .\launcher\DistroLauncher-Appx\Ubuntu.vcxproj '10.0.16215.0' '10.0.16237.0'
    Find-AndReplace .\launcher\DistroLauncher-Appx\Ubuntu.vcxproj 'MyDistro.appxmanifest' '$(Platform)/Ubuntu.appxmanifest'
    Find-AndReplace .\launcher\DistroLauncher-Appx\Ubuntu.vcxproj 'mydistro' "$ExecName"
    Find-AndReplace .\launcher\DistroLauncher-Appx\Ubuntu.vcxproj '<ProjectName>DistroLauncher-Appx</ProjectName>' '<ProjectName>Ubuntu</ProjectName>'
    Find-AndReplace .\launcher\DistroLauncher-Appx\Ubuntu.vcxproj '<AppxAutoIncrementPackageRevision>True</AppxAutoIncrementPackageRevision>' ''
    Find-AndReplace .\launcher\DistroLauncher-Appx\Ubuntu.vcxproj "<Command>copy `$(SolutionDir)\`$(platform)\`$(Configuration)\launcher.exe `$(SolutionDir)\`$(platform)\`$(Configuration)\`$(ProjectName)\`$(targetname).exe</Command>" "<Command>copy `$(OutDir)\..\launcher.exe `$(OutDir)\`$(targetname).exe</Command>"
    Find-AndInsertAfter .\launcher\DistroLauncher-Appx\Ubuntu.vcxproj '<AppxBundlePlatforms>x64|arm64</AppxBundlePlatforms>' '    <AppxSymbolPackageEnabled>True</AppxSymbolPackageEnabled>'
    Find-AndInsertAfter .\launcher\DistroLauncher-Appx\Ubuntu.vcxproj '<None Include="Package.StoreAssociation.xml" />' ''

    Find-AndReplace .\launcher\DistroLauncher-Appx\MyDistro.appxmanifest ' Name="WSL-DistroLauncher"' " Name=`"$PkgName`""
    Find-AndReplace .\launcher\DistroLauncher-Appx\MyDistro.appxmanifest 'Version="1.0.0.0"' "Version=`"$PkgVersion`""
    Find-AndReplace .\launcher\DistroLauncher-Appx\MyDistro.appxmanifest 'CN=Windows Console Dev Team' "$PublishID"
    Find-AndReplace .\launcher\DistroLauncher-Appx\MyDistro.appxmanifest 'ProcessorArchitecture="x64"' 'ProcessorArchitecture="ARCHITECTUREPLACEHOLDER"'
    Find-AndReplace .\launcher\DistroLauncher-Appx\MyDistro.appxmanifest 'WSL-DistroLauncher' "$FullName"
    Find-AndReplace .\launcher\DistroLauncher-Appx\MyDistro.appxmanifest 'mydistro' "$ExecName"
    Find-AndReplace .\launcher\DistroLauncher-Appx\MyDistro.appxmanifest 'My Own Distro Launcher' "$FullName on Windows"
    Find-AndInsertAfter .\launcher\DistroLauncher-Appx\MyDistro.appxmanifest '<uap:DefaultTile Wide310x150Logo="Assets\Wide310x150Logo.png" Square310x310Logo="Assets\LargeTile.png" Square71x71Logo="Assets\SmallTile.png">' '<uap:ShowNameOnTiles><uap:ShowOn Tile="square150x150Logo" /></uap:ShowNameOnTiles>'
    Find-AndReplace .\launcher\DistroLauncher-Appx\MyDistro.appxmanifest '<uap:DefaultTile Wide310x150Logo="Assets\Wide310x150Logo.png" Square310x310Logo="Assets\LargeTile.png" Square71x71Logo="Assets\SmallTile.png">' "<uap:DefaultTile Wide310x150Logo=`"Assets\Wide310x150Logo.png`" Square310x310Logo=`"Assets\LargeTile.png`" Square71x71Logo=`"Assets\SmallTile.png`" ShortName=`"$FullName`">"
    #sFind-AndReplace .\launcher\DistroLauncher-Appx\MyDistro.appxmanifest 'transparent' '#E95420'
    Find-AndReplace .\launcher\DistroLauncher-Appx\MyDistro.appxmanifest '10.0.16215.0' '10.0.16237.0'