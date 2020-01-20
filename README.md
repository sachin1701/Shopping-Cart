
    
    
1) rails db:seed
2) Api ----

GET All Product --

GET"localhost:3000/products"

Response - 

[
    {
        "id": 1,
        "name": "A",
        "price": 30,
        "created_at": "2020-01-20T06:53:52.054Z",
        "updated_at": "2020-01-20T06:53:52.054Z"
    },
    {
        "id": 2,
        "name": "B",
        "price": 20,
        "created_at": "2020-01-20T06:53:52.059Z",
        "updated_at": "2020-01-20T06:53:52.059Z"
    },
    {
        "id": 3,
        "name": "C",
        "price": 50,
        "created_at": "2020-01-20T06:53:52.063Z",
        "updated_at": "2020-01-20T06:53:52.063Z"
    },
    {
        "id": 4,
        "name": "D",
        "price": 15,
        "created_at": "2020-01-20T06:53:52.067Z",
        "updated_at": "2020-01-20T06:53:52.067Z"
    }
    ]
    2) Add Product to Cart ----
    
    API - POST"localhost:3000/orders"
    
    Body: 
    
    {
	    "products": [{"id": 1,"quantity": 4}, {"id": 2,"quantity": 3}]
    }
    
    
    Response - 
    
    {
    "cart_amount": 160,
    "cart_effective_amount": 140,
    "product_details": [
        {
            "name": "A",
            "effective_amount": 105,
            "amount": 120,
            "quantity": 4
        },
        {
            "name": "B",
            "effective_amount": 55,
            "amount": 60,
            "quantity": 3
        }
    ]
}
    
    
    
    
    
    
    
    
    
    
