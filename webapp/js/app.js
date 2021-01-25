Ext.application({
name: 'cars',
launch: () => {
    var grid = Ext.create('Ext.grid.Panel', {
             tools: [ {
                    itemId: 'dataToXls',
                    style: 'background-image: url(images/excel15.png)',
                    handler: function () {
                        // do refresh
                    }
                }],
            title: 'cars',
            store: null,
            columns: [
                { text: 'Идентификатор',width:120, dataIndex: 'id' },
                { text: 'Марка', dataIndex: 'brand' },
                { text: 'Модель', dataIndex: 'model' },
                { text: 'Год начала производства',width:150, dataIndex: 'releaseDateYear' },
                { text: 'Месяц начала производства',width:160, dataIndex: 'releaseDateMonth' },
                { text: 'Рабочий объём двигателя',width:150,     dataIndex: 'engineDisplacement' },
                { text: 'Турбонагнетатель',width:120, dataIndex: 'turbocharger' },
                { text: 'Лошадиная сила', dataIndex: 'horsepower' },
                { text: 'Трансмиссия', dataIndex: 'transmission' },
                { text: 'Привод', dataIndex: 'drive' },
                { text: 'Кузов', dataIndex: 'body' },
                { text: 'Цвет', dataIndex: 'colour' },


            ],
    });
    var viewport = new Ext.container.Viewport({
                layout: 'fit',
                items: grid
    });
}})

