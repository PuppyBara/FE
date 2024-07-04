import 'package:flutter/material.dart';
import 'package:frontend/models/shelter_dog_id/shelter_dog_detail_model.dart';
import 'package:frontend/services/ai_search_api_service.dart';

class AiResultDetailScreen extends StatelessWidget {
  const AiResultDetailScreen({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    final Future<ShelterDogDetailModel> details =
        AiSearchApiService.getDetailDogInfo(id);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dog Details'),
      ),
      body: FutureBuilder<ShelterDogDetailModel>(
        future: details,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('No data available'));
          } else {
            // 데이터가 있을 때 화면에 표시
            var dogInfo = snapshot.data!;
            return SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(dogInfo.shelterDogInfo.image),
                  const SizedBox(height: 20.0),
                  Text('Breed: ${dogInfo.shelterDogInfo.breed}'),
                  Text('Sex: ${dogInfo.shelterDogInfo.sex}'),
                  Text('Color: ${dogInfo.shelterDogInfo.color}'),
                  Text(
                      'Is Neutering: ${dogInfo.shelterDogInfo.isNeutering ? 'Yes' : 'No'}'),
                  Text('Feature: ${dogInfo.shelterDogInfo.feature}'),
                  const SizedBox(height: 20.0),
                  Text('Location: ${dogInfo.etcInfo.location}'),
                  Text('Date Time: ${dogInfo.etcInfo.dateTime.toString()}'),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
