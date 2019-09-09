pipeline {
    agent none
        stages {
            stage('Build') {
                agent {
                    dockerfile true
                }
                stages {
                    stage('Configure') {
                        steps {
                            sh 'make distclean || ./autogen.sh'
                            sh 'mkdir -p build'
                            sh 'cd build && ../configure'
                        }
                    }
                    stage('Build') {
                        steps {
                            sh 'cd build && make'
                        }
                    }
                    stage ('Archive') {
                        steps {
                            archiveArtifacts artifacts: 'build/*.lo'
                            archiveArtifacts artifacts: 'build/*.la'
                        }
                    }
                }
            }
    }
}
