<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Survey results</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
</head>
<body>
    <section class="mt-5 d-flex justify-content-center">
        <h5>Котики</h5>
        <div class="progress col-4 d-flex justify-content-left">
            <div class="progress-bar-cats" role="progressbar" style="width: 0%" aria-valuenow="0" aria-valuemin="0"
                aria-valuemax="100"></div>
        </div>
    </section>
    <section class="mt-5 d-flex justify-content-center">
        <h5>Песики</h5>
        <div class="progress col-4 d-flex justify-content-left">
            <div class="progress-bar-dogs" role="progressbar" style="width: 0%" aria-valuenow="0" aria-valuemin="0"
                aria-valuemax="100"></div>
        </div>
    </section>
    <section class="mt-5 d-flex justify-content-center">
        <h5>Попугайчики</h5>
        <div class="progress col-4 d-flex justify-content-left">
            <div class="progress-bar-parrots" role="progressbar" style="width: 0%" aria-valuenow="0" aria-valuemin="0"
                aria-valuemax="100"></div>
        </div>
    </section>
    <section class="mt-5 d-flex justify-content-around">
        <div>
            <label for="id_check" class="h6">Отобразить %</label>
            <input name="check" type="checkbox" id="id_check">
        </div> 
        <p class="h6 total-count"></p>      
    </section>

    <script>
    const header = new Headers({
        'Access-Control-Allow-Credentials': true,
        'Access-Control-Allow-Origin': '*'
    });

    const url = new URL('http://localhost:{{port}}/sse/vote/stats');

    const ES = new EventSource(url, header);

    const progressCats = document.querySelector('.progress-bar-cats');
    const progressDogs = document.querySelector('.progress-bar-dogs');
    const progressParrots = document.querySelector('.progress-bar-parrots');
    const checkBox = document.querySelector('#id_check')
    const totalCount = document.querySelector('.total-count')

    ES.onerror = error => {
        ES.readyState ? alert("что-то пошло не так!") : null;
    };

    ES.onmessage = message => {
        msg_ = JSON.parse(message.data);
        sum_ = msg_.cats + msg_.dogs + msg_.parrots;
        if (checkBox.checked){
            cats_ = Math.round(msg_.cats / sum_ * 100);
            dogs_ = Math.round(msg_.dogs / sum_ * 100);
            parrots_ = Math.round(msg_.parrots / sum_ *100);
            end_ = '%';
        }
        else{
            cats_ = msg_.cats;
            dogs_ = msg_.dogs;
            parrots_ = msg_.parrots;
            end_ = '';
        }
        totalCount.innerText = `всего: ${sum_}`;
        progressCats.style.cssText = `width: ${cats_}${end_};`
        progressCats.textContent = `${cats_}${end_}`

        progressDogs.style.cssText = `width: ${dogs_}${end_};`
        progressDogs.textContent = `${dogs_}${end_}`

        progressParrots.style.cssText = `width: ${parrots_}${end_};`
        progressParrots.textContent = `${parrots_}${end_}`
    };
    </script>
</body>
</html>