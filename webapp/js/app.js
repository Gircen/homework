Ext.application({
name: 'cars',
launch: () => {
    var store =Ext.create('Ext.data.Store', {
        storeId:'testStore',
        fields:['id','brand','model','releaseDateYear','releaseDateMonth','engineDisplacement','turbocharger','horsepower','transmission','drive','body','colour'],
        data:[
            {id:1,brand:'bmw',model:'x5',releaseDateYear:1999,releaseDateMonth:1,engineDisplacement:3.0,turbocharger:false,horsepower:230.0,transmission:'Автомат',drive:'Полный',body:'Внедорожник',colour:'чёрный'},
            {id:2,brand:'bmw',model:'x6',releaseDateYear:2010,releaseDateMonth:1,engineDisplacement:3.0,turbocharger:false,horsepower:350.0,transmission:'Автомат',drive:'Полный',body:'Внедорожник',colour:'чёрный'}
            ]
    });
    var grid = Ext.create('Ext.grid.Panel', {
             tools: [ {
                    itemId: 'dataToXls',
                    style: 'background-image: url(images/excel15.png)',
                    handler: function () {
                        // do refresh
                    }
                }],
            title: 'cars',
            store: store,
            plugins: 'gridfilters',
            columns: [
                { text: 'Идентификатор',width:120, dataIndex: 'id', filter:{type:'number'}},
                { text: 'Марка', dataIndex: 'brand' ,filter:{type:'string'}},
                { text: 'Модель', dataIndex: 'model', filter:{type:'string'}},
                { text: 'Год начала производства',width:150, dataIndex: 'releaseDateYear', xtype:'datecolumn', format:'Y',filter:{type:'string'}},
                { text: 'Месяц начала производства',width:160, dataIndex: 'releaseDateMonth', xtype:'datecolumn', format:'M',filter:{type:'date'}},
                { text: 'Рабочий объём двигателя',width:150,     dataIndex: 'engineDisplacement' },
                { text: 'Турбонагнетатель',width:120, xtype:'booleancolumn', dataIndex: 'turbocharger' },
                { text: 'Лошадиная сила', dataIndex: 'horsepower' },
                { text: 'Трансмиссия', dataIndex: 'transmission' },
                { text: 'Привод', dataIndex: 'drive' },
                { text: 'Кузов', dataIndex: 'body' },
                { text: 'Цвет', dataIndex: 'colour' },


            ],
        features: [{ftype:'grouping'}],
    });
    var viewport = new Ext.container.Viewport({
                layout: 'fit',
                items: grid
    });
}});

