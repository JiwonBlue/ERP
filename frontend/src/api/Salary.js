import axios from "axios";

export const selectSalaryList = async (id) => {
    try {
        const response = await axios.get(`/api/salary/list/${id}`);
        return response.data;
    } catch (error) {
        throw error;
    }
};

export const salaryInsert = async (params) => {
    return new Promise((resolve, reject) => {
        axios.post('/api/salary', params)
            .then((res) => {
                return resolve(res);
            })
            .catch((err) => {
                return reject(err);
            })
    })
}

export const salaryDelete = async (id) => {
        return new Promise((resolve, reject) => {
        axios.delete(`/api/salary/${id}`)
            .then((res) => {
                return resolve(res);
            })
            .catch((err) => {
                return reject(err);
            })
    })
    try {
        const response = await axios.delete(`/api/salary/${id}`);
        return response.data;
    }catch (error){
        throw error;
    }
};
