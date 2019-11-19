pipeline {
    agent none
    stages {
	stage('Build all') {
            parallel {
                stage('Build') {
                    agent {
                        dockerfile true
                    }
                    stages {
                        stage('Configure') {
                            steps {
                                sh 'make distclean || true'
                                sh 'mkdir -p build && rm -rf /tmp/libxmlinstall && mkdir -p /tmp/libxmlinstall/usr/local'
                                sh 'cd build && CFLAGS=-m32 LDFLAGS=-m32 ../autogen.sh --prefix=/tmp/libxmlinstall/usr/local --without-python'
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
                stage('Build x64') {
                    agent {
                        dockerfile { filename 'Dockerfile.x64' }
                    }
                    stages {
                        stage('Configure x64') {
                            steps {
                                sh 'make distclean || true'
                                sh 'mkdir -p build && rm -rf /tmp/libxmlinstall && mkdir -p /tmp/libxmlinstall/usr/local'
                                sh 'cd build && ../autogen.sh --prefix=/tmp/libxmlinstall/usr/local --without-python'
                            }
                        }
                        stage('Build x64') {
                            steps {
                                sh 'cd build && make -j && make install'
                                sh 'tar -C /tmp/libxmlinstall -cf libxml2_x64.tar.gz .'
                            }
                        }
                        stage ('Archive x64') {
                            steps {
                                archiveArtifacts artifacts: 'libxml2_x64.tar.gz'
                            }
                        }
                    }
                }
	    }
        }
    }
}
