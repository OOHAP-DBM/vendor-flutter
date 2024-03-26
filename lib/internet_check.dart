/*
import 'package:oohapp/core/constants/app_constant.dart';
import 'package:oohapp/widgets/custom_buttons/custom_button.dart';
import 'core/app_export.dart';

class InternetCheck extends StatelessWidget {
  const InternetCheck({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppConstant.appName,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: Column(
        children: [
          BlocConsumer<InternetCubit, InternetState>(
            listener: (context, state) {
              if (state == InternetState.gained) {
                CustomSnackBar(
                  color: Colors.green,
                  text: 'You are online now !',
                  second: 3,
                  icon: Icons.network_cell,
                ).showSnackBar(context);
              } else if (state == InternetState.lost) {
                CustomSnackBar(
                        color: Colors.red,
                        text: 'Internet lost',
                        second: 3,
                        icon: Icons.network_check)
                    .showSnackBar(context);
              }
            },
            builder: (context, state) {
              return const Center(
                child: Text('Hello OohApp'),
              );
            },
          ),
          CustomButton(
            backgroundColor: Colors.green,
            onTap: () {},
            text: 'LOGIN',
          )
        ],
      ),
    );
  }
}
*/
