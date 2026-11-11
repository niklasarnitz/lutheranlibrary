\version "2.24.3"
% Lochner, Liedförmiges Kyrie. PDF scan 142, printed p. 117.
#(set-global-staff-size 18)
\header { tagline = ##f }
\paper { paper-width = 180\mm left-margin = 4\mm right-margin = 0\mm top-margin = 0\mm bottom-margin = 0\mm indent = 0\mm print-page-number = ##f page-breaking = #ly:one-page-breaking }
\score {
  \new PianoStaff <<
    \new Staff <<
      \clef treble \omit Staff.TimeSignature \cadenzaOn
      \new Voice = "sung" { \voiceOne g'2 \bar "|" a'4 b'4 c''4 b'4 \bar "|" a'2 g'2 \bar "|" a'2 a'4 g'4 \bar "|" f'4 e'4 fis'2 \bar "|" g'2 \bar "||" }
      \new Voice { \voiceTwo b2 d'4 d'4 c'4 d'4 d'2 b2 d'2 c'4 e'4 d'4 cis'4 d'2 d'2 }
    >>
    \new Lyrics \lyricsto "sung" { \set ignoreMelismata = ##t und nach deim Wil -- len stre -- "ben," er -- bar -- me dich ü -- ber "uns!" }
    \new Staff <<
      \clef bass \omit Staff.TimeSignature \cadenzaOn
      \new Voice { \voiceOne g2 fis4 g4 e4 g4 fis!2 g2 f!2 a4 c'4 a4 a4 a2 b2 }
      \new Voice { \voiceTwo e2 dis4 b,4 a,4 g,4 dis!2 g,2 d!2 f4 c4 d4 a,4 d2 g,2 }
    >>
  >>
  \layout { ragged-right = ##f \context { \Score \autoBeamOff \remove "Bar_number_engraver" } }
}
