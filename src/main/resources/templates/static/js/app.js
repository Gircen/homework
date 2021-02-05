Ext.application({
    name: 'cars',
    launch: () = > {

    var store = Ext.create('Ext.data.Store', {
        storeId: 'testStore',
        fields: ['id', 'brand', 'model', 'releaseDateYear', 'releaseDateMonth', 'engineDisplacement', 'turbocharger', 'horsepower', 'transmission', 'drive', 'body', 'colour'],
        data: [
            {
                id: 1,
                brand: 'bmw',
                model: 'x5',
                releaseDateYear: '1999',
                releaseDateMonth: 1,
                engineDisplacement: 3.0,
                turbocharger: false,
                horsepower: 230.0,
                transmission: 'Автомат',
                drive: 'Полный',
                body: 'Внедорожник',
                colour: 'чёрный'
            },
            {
                id: 2,
                brand: 'bmw',
                model: 'x6',
                releaseDateYear: '2010',
                releaseDateMonth: 1,
                engineDisplacement: 3.0,
                turbocharger: false,
                horsepower: 350.0,
                transmission: 'Автомат',
                drive: 'Полный',
                body: 'Внедорожник',
                colour: 'чёрный'
            }
        ]
    });
var grid = Ext.create('Ext.grid.Panel', {
    layout: 'fit',
    store: store,
    height: 600,
    plugins: 'gridfilters',
    columns: [
        {text: 'Идентификатор', width: 120, dataIndex: 'id', filter: {type: 'number'}},
        {text: 'Марка', dataIndex: 'brand', filter: {type: 'string'}, editor: {xtype: 'textfield', allowBlank: false}},
        {text: 'Модель', dataIndex: 'model', filter: {type: 'string'}, editor: {xtype: 'textfield', allowBlank: false}},
        {text: 'Год выпуска', width: 150, dataIndex: 'releaseDateYear', editor: {xtype: 'combobox', allowBlank: false}},
        {
            text: 'Месяц выпуска',
            width: 160,
            dataIndex: 'releaseDateMonth',
            editor: {xtype: 'combobox', allowBlank: false}
        },
        {
            text: 'Рабочий объём двигателя',
            width: 150,
            dataIndex: 'engineDisplacement',
            editor: {xtype: 'numberfield', allowBlank: false}
        },
        {
            text: 'Турбонагнетатель',
            width: 120,
            xtype: 'booleancolumn',
            dataIndex: 'turbocharger',
            editor: {xtype: 'checkbox', allowBlank: false}
        },
        {text: 'Лошадиная сила', dataIndex: 'horsepower', editor: {xtype: 'numberfield', allowBlank: false}},
        {text: 'Трансмиссия', dataIndex: 'transmission', editor: {xtype: 'combobox', allowBlank: false}},
        {text: 'Привод', dataIndex: 'drive', editor: {xtype: 'combobox', allowBlank: false}},
        {text: 'Кузов', dataIndex: 'body', editor: {xtype: 'combobox', allowBlank: false}},
        {text: 'Цвет', dataIndex: 'colour', editor: {xtype: 'textfield', allowBlank: false}},


    ], plugins: [{
        ptype: 'rowediting',
        clicksToEdit: 2
    }],
    features: [{ftype: 'grouping'}],
});

var mainPanel = Ext.create('Ext.Panel',
    {
        items: [{
            xtype: 'panel',
            title: 'cars',
            tools: [
                {
                    itemId: 'dataToXls', style: 'background-image: url(images/excel15.png)',
                    handler: function () {
                    }
                }],
            layout: {type: 'hbox', align: 'stretch'}, items: [
                {xtype: 'combobox', fieldLabel: 'Год'},
                {xtype: 'combobox', margin: '0 0 0 5', fieldLabel: 'Месяц'},
                {xtype: 'button', margin: '0 0 0 5', text: 'Добавить'},
                {xtype: 'button', margin: '0 0 0 5', text: 'Удалить'}]
        },
            grid
        ]
    });
var viewport = new Ext.container.Viewport({
    layout: 'fit',
    items: [mainPanel, {xtype: 'panel'}]
});
}
})
;

