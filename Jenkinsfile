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
                            sh 'make distclean || true'
                            sh 'mkdir -p build'
                            sh 'cd build && ../autogen.sh'
                        }
                    }
                    stage('Build') {
                        steps {
                            sh 'cd build && make'
                        }
                    }
                    stage ('Archive') {
                        steps {
                            archiveArtifacts artifacts: 'build/.libs/*.so*'
                        }
                    }
                }
            }
    }
}
