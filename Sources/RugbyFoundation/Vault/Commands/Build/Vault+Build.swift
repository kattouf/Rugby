import Fish
import Rainbow

extension Vault {
    /// The manager to build CocoaPods project.
    public func buildManager() -> IBuildManager {
        internalBuildManager()
    }

    // MARK: - Internal

    func internalBuildManager() -> IInternalBuildManager {
        let xcodeProject = xcode.project(projectPath: router.podsProjectPath)
        let buildTargetsManager = BuildTargetsManager(xcodeProject: xcodeProject)
        let useBinariesManager = internalUseBinariesManager(xcodeProject: xcodeProject,
                                                            buildTargetsManager: buildTargetsManager)
        let binariesCleaner = BinariesCleaner(
            logger: logger,
            limit: settings.storageUsedLimit,
            sharedRugbyFolderPath: router.rugbySharedFolderPath,
            binariesFolderPath: router.binFolderPath,
            localRugbyFolderPath: router.rugbyPath,
            buildFolderPath: router.buildPath
        )
        return BuildManager(logger: logger,
                            buildTargetsManager: buildTargetsManager,
                            librariesPatcher: LibrariesPatcher(logger: logger),
                            xcodeProject: xcodeProject,
                            rugbyXcodeProject: RugbyXcodeProject(xcodeProject: xcodeProject),
                            backupManager: backupManager(),
                            processMonitor: processMonitor,
                            xcodeBuild: xcodeBuild(),
                            binariesStorage: binariesStorage,
                            targetsHasher: targetsHasher(),
                            useBinariesManager: useBinariesManager,
                            binariesCleaner: binariesCleaner,
                            environmentCollector: environmentCollector,
                            env: env,
                            targetTreePainter: TargetTreePainter())
    }
}
