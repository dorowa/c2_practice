<html>
    <head>
        <meta charset="utf-8">
        <title>Global survey</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-12 p-2" style="background-color: blue; border-radius: 20px 20px 0 0">
                    <h3 style="text-transform: uppercase; text-align: center; color: yellow; ">Опрос: ваша самая мимишная живность</h3>
                </div>
                <div class="col-6 m-0 p-1 d-flex flex-wrap align-items-center justify-content-center" style="background-color: yellow; color: blue; border-radius: 0 0 20px 20px; border-style: solid; border-color: black; text-align: center">
                    <h5 class="col-12">Голоcование - радио кнопками</h5>
                    <form action="/results/" method="POST" style="text-align: center;">
                            <label for="id_cats">Кошка:</label>
                            <input name="survey" type="radio" id="id_cats" value="cats">
                        
                            <label for="id_dogs">Собака:</label>
                            <input name="survey" type="radio" id="id_dogs" value="dogs">
                       
                            <label for="id_parrots">Попугай:</label>
                            <input name="survey" type="radio" id="id_parrots" value="parrots">                        
                        <div class="col-12 p-1" style="text-align: center;"><input value="Голосуй!" type="submit" /></div>
                    </form>
                </div>
                <div class="col-6 m-0 p-1 d-flex flex-wrap align-items-center justify-content-center" style="background-color: yellow; color: blue; border-radius: 0 0 20px 20px; border-style: solid; border-color: black; text-align: center;">
                    <h5 class="col-12">Голосование - обычные кнопки</h5>
                    <form action="/sse/vote/cats" method="POST">
                        <div class="col-12 p-1" style="text-align: right;">
                            <label for="id_cats_button">Кошка:</label>
                            <input value="Мяу!!!" type="submit" id="id_cats_button"></div>
                    </form>
                    <form action="/sse/vote/dogs" method="POST">
                        <div class="col-12 p-1" style="text-align: right;">
                            <label for="id_dogs_button">Пес:</label>
                            <input value="Гав!!!" type="submit" id="id_dogs_button"></div>
                    </form>
                    <form action="/sse/vote/parrots" method="POST">
                        <div class="col-12 p-1" style="text-align: right;">
                            <label for="id_parrots_button">Попугай:</label>
                            <input value="Ррома!" type="submit" id="id_parrots_button"/></div>
                    </form>
                </div>

            </div>
        </div>
    </body>
</html>
