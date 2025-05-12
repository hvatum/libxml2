pipeline {
    agent none
    stages {
	stage('Build all') {
            parallel {
                stage('Build Bullseye') {
                    agent {
                        dockerfile { filename 'Dockerfile-Bullseye-x64' }
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
                                sh 'tar -C /tmp/libxmlinstall -cf libxml2_bullseye_x64.tar.gz .'
                            }
                        }
                        stage ('Archive x64') {
                            steps {
                                archiveArtifacts artifacts: 'libxml2_bullseye_x64.tar.gz'
                            }
                        }

                    }
                }
                stage('Build Bookworm') {
                    agent {
                        dockerfile { filename 'Dockerfile-Bookworm-x64' }
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
                                sh 'tar -C /tmp/libxmlinstall -cf libxml2_bookworm_x64.tar.gz .'
                            }
                        }
                        stage ('Archive x64') {
                            steps {
                                archiveArtifacts artifacts: 'libxml2_bookworm_x64.tar.gz'
                            }
                        }

                    }
                }

	    }
        }
    }
}
