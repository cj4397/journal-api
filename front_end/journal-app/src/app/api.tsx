import { useAuth } from "./auth";



export function useDatabase() {
    const { userData } = useAuth();
    const { accessToken, client, expiry, uid } = userData;

    const handleSubmit_sign_up = (e: any) => {
        e.preventDefault();


        async function apitry() {

            const response = await fetch('http://206.189.91.54/api/v1/auth/', {
                method: "POST",
                headers: {
                    "Content-Type": "application/json",
                },
                body: JSON.stringify(
                    {
                        name: name,
                        email: email,
                        password: password,
                        password_confirmation: password
                    }
                )
            });
            const data = await response.json();
            console.log(data);
        }
        apitry()
    }

    return {

    };
}
