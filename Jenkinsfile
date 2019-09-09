pipeline {
    agent none
        stages {
            stage('Build') {
                agent {
                    docker {image '311173c2826b'}
                }
                stages {
                    stage('Configure') {
                        steps {
                            sh './autogen.sh'
                            sh 'mkdir build'
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
