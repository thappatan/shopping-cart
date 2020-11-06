# Shopping Cart Workshop

## steps

- Run unit test & report

 ```sh
    cd store-service
    go mod download
    go test -v ./cmd/tests 2>&1 | go-junit-report > report.xml 
 ```

- Build package(Image)
- Start appilication

 ```sh
     docker-compose up -d --build --force-recreate
 ```
- Run API test

    ```sh
        # cd test/api
        python3 -m venv env
        source env/bin/activate
        pip install -r requirements.txt
        robot greeting.robot
        deactivate
    ```