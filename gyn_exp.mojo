from python import Python

fn get_gym() raises -> PythonObject:
    var gym = Python.import_module("gymnasium")
    return gym



fn main() raises -> None:
    print("Gym started")
    
    let gym = get_gym()
    let env = gym.make("CartPole-v1")

    var cart_pole_info = env.reset()

    for _ in range(1000):
        let action = env.action_space.sample()
        let overall_info = env.step(action)

        print(overall_info)

        if overall_info[2] or overall_info[3]:
            var new_start = env.reset()