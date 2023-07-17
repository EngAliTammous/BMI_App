import'package:flutter/material.dart';

class ContainerCounterWidget extends StatefulWidget {
   ContainerCounterWidget({Key? key,required this.type,required this.age, required this.weight}) : super(key: key);

  String type ;
  int age;
  int weight ;

  @override
  State<ContainerCounterWidget> createState() => _ContainerCounterWidgetState();
}

class _ContainerCounterWidgetState extends State<ContainerCounterWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(15.0),
        width: 50,
        height: 170,
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.type == 'age' ? 'Age' : 'Weight',
                style: Theme.of(context).textTheme.headline3,
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                widget.type == 'age' ? '${widget.age}' : '${widget.weight}',
                style: Theme.of(context).textTheme.headline3,
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FloatingActionButton(
                   heroTag: widget.type == 'age' ? 'age--' : 'weight--',
                    elevation: 0,
                    onPressed: () {
                      setState(() {
                        widget.type == 'age' ? widget.age-- : widget.weight--;
                      });
                    },
                    child: const Icon(
                      Icons.remove,
                      size: 25.0,
                    ),
                  ),
                  FloatingActionButton(
                    heroTag: widget.type == 'age' ? 'age++' : 'weight++',
                    elevation: 0,
                    onPressed: () {
                      setState((){
                        widget.type == 'age' ? widget.age++ : widget.weight++;

                      });
                    },
                    child: const Icon(
                      Icons.add,
                      size: 25.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
