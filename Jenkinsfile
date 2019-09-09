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
                            sh 'mkdir -p build && rm -rf /tmp/libxmlinstall && mkdir -p /tmp/libxmlinstall/usr/local'
                            sh 'cd build && ../autogen.sh --prefix=/tmp/libxmlinstall/usr/local --without-python'
                        }
                    }
                    stage('Build') {
                        steps {
                            sh 'cd build && make -j && make install'
                            sh 'tar -C /tmp/libxmlinstall -cf libxml2.tar.gz .'
                        }
                    }
                    stage ('Archive') {
                        steps {
                            archiveArtifacts artifacts: 'build/.libs/*.so*'
                            archiveArtifacts artifacts: 'libxml2.tar.gz'
                        }
                    }
                }
            }
    }
}
