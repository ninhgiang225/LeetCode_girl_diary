import pandas as pd

def accepted_candidates(candidates: pd.DataFrame, rounds: pd.DataFrame) -> pd.DataFrame:
    # gina lam cau nay
    experienced_candidate = candidates[candidates["years_of_exp"] >= 2]

    rounds["total_score"] = rounds.groupby("interview_id")["score"].transform("sum")
    highscore_candidate = rounds[rounds["total_score"] > 15]
    
    qualifed_candidate = experienced_candidate.merge(highscore_candidate, on="interview_id", how="inner")[["candidate_id"]].drop_duplicates()

    return qualifed_candidate
    