node {
    def app

    stage('Clone repository') {
        /* Clone repository */

        checkout scm
    }

    stage('Build Docker image') {
        /* Build docker image locally */

        app = docker.build("naddous/demoblog")
    }

    stage('Test image') {
        /* Ideally, we would run a test framework against our image */

        app.inside {
            sh 'echo "Tests passed"'
        }
    }

    stage('Push image') {
        /* push the image with two tags:
         * First, the incremental build number from Jenkins
         * Second, the 'latest' tag.
         * Pushing multiple tags is cheap, as all the layers are reused. */
        docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
        }
    }
}