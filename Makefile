.PHONY: protos
.PHONY: grpcurl

protos:
 	protoc -I protos/ --go-grpc_out=protos/currency --go_out=protos/currency protos/currency.proto
	
	
curl:
	grpcurl --plaintext -d '{"base":"GBP", "destination": "USD"}' localhost:9092 Currency.GetRate
curl2:
	grpcurl --plaintext localhost:9092 describe .RateRequest

	
nothing:
	protoc -I protos/ protos/currency.proto --go_out=plugins=grpc:protos/currency